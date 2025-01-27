class CurrentOrder 
    attr_accessor :ordered_items
  attr_accessor :total
  attr_accessor :delivery_cost
  attr_accessor :sub_total
  attr_accessor :pickup_time

  def initialize(current_order)
    @ordered_items = current_order["items"] || {}
    current_order["details"] ||= {}
    @total = current_order["details"]["total"].to_i || 0
    @delivery_cost = 500
    @sub_total = current_order["details"]["sub_total"].to_i || 0
    @pickup_time = current_order["details"]["pickup_time"].to_i || 0
    @employee = {}
    @invoice = ""
    @transaction_id = ""
    @status = "pending"
  end

  def vat
    0.1 * @sub_total
  end

  def update_order(order, args)
    @ordered_items = order["items"] || {}
    @total = order["details"]["total"] || 0
    @pickup_time = order["details"]["pickup_time"].to_i || 0
    @total_pickup_time = add_extra_time(@pickup_time)
    @invoice = args[:invoice] || ""
    @transaction_id = args[:transaction_id] || ""
    @status = args[:status] || "pending"
  end

  def paypal_url(current_employee, return_url)
    @employee = current_employee
		values = {
			:business => 'tru2cent-facilitator@gmail.com',
			:cmd => '_cart',
			:upload => 1,
      :rm => 2,
			:return => return_url,
			# :invoice => 15,
      :notify_url => @employee.email,
      "amount_#{@ordered_items.length+1}" => vat,
      "item_name_#{@ordered_items.length+1}" => "VAT",
      "amount_#{@ordered_items.length+2}" => @delivery_cost,
      "item_name_#{@ordered_items.length+2}" => "Delivery cost"
		}
    counter = 1
		@ordered_items.each do |index, details|
			values.merge!({
				"amount_#{counter}" => details["food"]["price"],
				"item_name_#{counter}" => details["food"]["name"],
				"item_number_#{counter}" => counter,
				"quantity_#{counter}" => details["qty"]
			})
      counter += 1
		end
    "https://www.sandbox.paypal.com/cgi-bin/webscr?" + values.to_query
	end

  def save_order(current_employee)
    employee = current_employee
    new_order = employee.orders.new(total: @total, vat: vat,
                                delivery_cost: @delivery_cost,
                                invoice: @invoice,
                                transaction_id: @transaction_id,
                                pickup_time: @total_pickup_time)
    save_successful = new_order.save
    if save_successful
      @ordered_items.each do |index, details|
        new_order.order_items <<
          OrderItem.create(food_id: details["food"]["id"],
                           quantity: details["qty"])
      end
    end
    save_successful
  end

  def delete

  end

  private

  def add_extra_time(pick_up_time)
    if (Order.first.Status != "Delivered") || (Order.first.Status == "Cancelled")
       pick_up_time + 4
     else 
      pick_up_time
    end
  end
end

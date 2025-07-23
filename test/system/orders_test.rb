require "application_system_test_case"

class OrdersTest < ApplicationSystemTestCase
  setup do
    @order = orders(:one)
  end

  test "visiting the index" do
    visit orders_url
    assert_selector "h1", text: "Orders"
  end

  test "should create order" do
    visit orders_url
    click_on "New order"

    fill_in "Delivery address", with: @order.delivery_address
    fill_in "Estimated price", with: @order.estimated_price
    fill_in "Items description", with: @order.items_description
    fill_in "Pickup address", with: @order.pickup_address
    fill_in "Requested at", with: @order.requested_at
    fill_in "User", with: @order.user_id
    click_on "Create Order"

    assert_text "Order was successfully created"
    click_on "Back"
  end

  test "should update Order" do
    visit order_url(@order)
    click_on "Edit this order", match: :first

    fill_in "Delivery address", with: @order.delivery_address
    fill_in "Estimated price", with: @order.estimated_price
    fill_in "Items description", with: @order.items_description
    fill_in "Pickup address", with: @order.pickup_address
    fill_in "Requested at", with: @order.requested_at.to_s
    fill_in "User", with: @order.user_id
    click_on "Update Order"

    assert_text "Order was successfully updated"
    click_on "Back"
  end

  test "should destroy Order" do
    visit order_url(@order)
    click_on "Destroy this order", match: :first

    assert_text "Order was successfully destroyed"
  end
end

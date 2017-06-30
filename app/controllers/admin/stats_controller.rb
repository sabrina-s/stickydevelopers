class Admin::StatsController < ApplicationController
  def show
    # Orders group by date
    @dates_count = {}
    ((Date.today-30)..Date.today).each do |date|
      @dates_count[date] = 0
    end
    @dates_count.merge!(Order.group("date(created_at)").count)

    # Amount group by date
    @dates_amount = {}
    ((Date.today-30)..Date.today).each do |date|
      total_in_day = 0
      Order.where("date(created_at) = ?", date).each do |order|
        total_in_day += order.get_total
      end
      @dates_amount[date] = total_in_day
    end

    @users_count = {}
    ((Date.today-30)..Date.today).each do |date|
      total_users = 0
      total_users += User.where("date(created_at) = ?", date).count
      @users_count[date] = total_users
    end
  end
end

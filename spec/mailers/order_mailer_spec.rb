require "rails_helper"

RSpec.describe OrderMailer, type: :mailer do
  let(:user) { create(:user) }
  let(:address) { create(:address, user: user) }
  let(:order) { create(:order, user: user, address: address) }


  describe 'order summary email' do
    let(:mail) { OrderMailer.order_summary_email(user, order) }
    it { expect(mail.subject).to eq('Your order summary') }
    it { expect(mail.to).to eq([user.email]) }
  end

  describe 'order shipped email' do
    let(:mail) { OrderMailer.order_shipped_email(user, order) }
    it { expect(mail.subject).to eq('Your order is on the way!') }
    it { expect(mail.to).to eq([user.email]) }
  end
end

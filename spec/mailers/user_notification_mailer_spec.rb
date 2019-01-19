require 'rails_helper'

RSpec.describe UserNotificationMailer, type: :mailer do
  describe '#send_new_user_message' do
    let(:user) { mock_model User, first_name: 'Luke', last_name: 'Skywalker', email: 'luke@skywalker.com' }
    subject { UserNotificationMailer.send_new_user_message(user) }

    context 'send mail' do
      it 'sends an email' do
        expect { subject.deliver }.to change(ActionMailer::Base.deliveries, :count).by(1)
      end
      it 'renders the subject' do
        expect(subject.subject).to eql('Thanks for registration in our App')
      end
      it 'renders the receiver email' do
        expect(subject.to).to eql([user.email])
      end
      it 'renders the sender email' do
        expect(subject.from).to eql(['noreply-golfersds@gmail.com'])
      end
    end
    context 'do not send mail'
  end
end

class EmailProcessor
  def self.process(email)
    Message.create!({ body: email.body, email: email.from })
  end
end
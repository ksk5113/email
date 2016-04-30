require 'mailgun'

class HomeController < ApplicationController
    def page
    end
    
    def send_email
        @title = params[:title]
        @add = params[:add]
        @content = params[:content]
        
        mg_client = Mailgun::Client.new("key-8019cc92ebaefc4d0172f76332ce9e69")

        message_params =  {
                            from: 'kskksk5113@gmail.com',
                            to:   @add,
                            subject: @title,
                            text:    @content
                          }

        result = mg_client.send_message('sandbox9fce38c2e61f4f91bd0c37478959f522.mailgun.org', message_params).to_h!

        message_id = result['id']
        message = result['message']
        
        new_em = Em.new
        new_em.title = @title
        new_em.adds = @add
        new_em.content = @content
        new_em.save
    
        redirect_to "/list"
    end
    
    def list
        @every_em = Em.all.order("id desc")
    end
end

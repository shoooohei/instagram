class PictureMailer < ApplicationMailer
  def picture_mail(picture)
    @picture = picture
    mail to: "shoheimoment@gmail.com", subject: "投稿完了メール"
  end
end

import smtplib, ssl

mail_port = 465  # For SSL
smtp_server = "smtp.gmail.com"
sender_email = "jaksiclabexperiments@gmail.com"  # Enter your address
mail_password = "kkvvdfrmwpdifjvr"
context = ssl.create_default_context()


def send_mail(receiver_email, message):
    with smtplib.SMTP_SSL(smtp_server, mail_port, context=context) as mail_server:
        mail_server.login(sender_email, mail_password)
        mail_server.sendmail(sender_email, receiver_email, message)

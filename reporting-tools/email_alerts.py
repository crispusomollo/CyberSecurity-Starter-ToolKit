#!/usr/bin/env python3
# Sends a simple email alert. Configure SMTP settings before use.
import smtplib
from email.message import EmailMessage

SMTP_HOST = "smtp.example.com"
SMTP_PORT = 587
SMTP_USER = "alerts@example.com"
SMTP_PASS = "CHANGE_ME"

def send_alert(subject, body, to="admin@example.com"):
    msg = EmailMessage()
    msg["From"] = SMTP_USER
    msg["To"] = to
    msg["Subject"] = subject
    msg.set_content(body)
    with smtplib.SMTP(SMTP_HOST, SMTP_PORT) as s:
        s.starttls()
        s.login(SMTP_USER, SMTP_PASS)
        s.send_message(msg)

if __name__ == "__main__":
    send_alert("Test Alert", "This is a test alert from Cybersecurity Toolkit.", "admin@example.com")

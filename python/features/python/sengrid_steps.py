# -*- coding: utf-8 -*-

from lettuce import step
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait # available since 2.4.0
from selenium.webdriver.support import expected_conditions as EC

import time

page_driver = None

@step(u'Given I send an email from sendgrid')
def given_i_send_an_email_from_sendgrid(step):
    driver = webdriver.Firefox()
    driver.get('http://sendgrid.com/docs/api_workshop.html')
    driver.switch_to_frame("");
    key = WebDriverWait(driver, 10).until(EC.presence_of_element_located((By.ID, "key")))
    key.send_keys('walketim@gmail.com')
    secret = driver.find_element_by_id('secret')
    secret.send_keys("Walket1msp@ssword")
    toggle_api_methods(driver)
    fill_in_required_email_form(driver)
    send_it = driver.find_element_by_id('Mail')
    send_it.click()
    page_driver = driver

@step(u'Then an email should have been sent')
def then_an_email_should_have_been_sent(step):
    did_except = None
    try:
      response_text = page_driver.find_element_by_class_name('error')
    except Exception:
      did_except = True
    assert did_except, 'no error was found in the response'

def toggle_api_methods(driver):
    toggle = driver.find_element_by_id('toggle-methods')
    toggle.click()

def fill_in_required_email_form(driver):
    param = driver.find_element_by_name('params[to]')
    param.send_keys("walketim@gmail.com")
    param = driver.find_element_by_name('params[from]')
    param.send_keys("walketim@gmail.com")
    param = driver.find_element_by_name('params[subject]')
    param.send_keys("Test Mail")
    param = driver.find_element_by_name('params[text]')
    param.send_keys("This is a test mail that can be safely discarded by recipient")

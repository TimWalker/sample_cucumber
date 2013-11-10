# -*- coding: utf-8 -*-

from lettuce import step
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait # available since 2.4.0
from selenium.webdriver.support import expected_conditions as EC

import time

@step(u'Given I send an email from sendgrid')
def given_i_send_an_email_from_sendgrid(step):
    driver = webdriver.Firefox()
    driver.get('http://sendgrid.com/docs/api_workshop.html')
    driver.switch_to_frame("");
    key = WebDriverWait(driver, 10).until(EC.presence_of_element_located((By.ID, "key")))
    key.send_keys('walketim@gmail.com')
    secret = driver.find_element_by_id('secret')
    secret.send_keys("walketimsp@ssword")
    toggle = driver.find_element_by_id('toggle-methods')
    toggle.click()
    #key = WebDriverWait(driver, 10).until(EC.presence_of_element_located((By.NAME, "params[to]")))
    param = driver.find_element_by_name('params[to]')
    param.send_keys("walketim@gmail.com")
    param = driver.find_element_by_name('params[from]')
    param.send_keys("walketim@gmail.com")
    param = driver.find_element_by_name('params[subject]')
    param.send_keys("Test Mail")
    param = driver.find_element_by_name('params[text]')
    param.send_keys("This is a test mail that can be safely discarded by recipient")
    send_it = driver.find_element_by_id('Mail')
    send_it.click()

    #driver.close()
    assert True, 'This step is a stub'

@step(u'Then an email should have been sent')
def then_an_email_should_have_been_sent(step):
    assert True, 'This step is a stub'

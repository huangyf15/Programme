import os
import pathlib
import unittest
import warnings

from selenium import webdriver

def file_uri(filename):
  return pathlib.Path(os.path.abspath(filename)).as_uri()

class WebpageTests(unittest.TestCase):

  @classmethod
  def setUpClass(cls):
    warnings.simplefilter("ignore", ResourceWarning)
    cls.driver = webdriver.Edge()
    cls.base_url = file_uri('counter.html')
    cls.verificationErrors = []
  
  @classmethod
  def tearDownClass(cls):
    cls.driver.quit()

  def tearDown(self):
    self.driver.refresh()
    self.assertEqual([], self.verificationErrors)

  def test_title(self):
    driver = self.driver
    driver.get(self.base_url)
    self.assertEqual(driver.title, "Counter")
    self.driver.refresh()

  def test_increase(self):
    driver = self.driver
    driver.get(self.base_url)
    increase = driver.find_element_by_id('increase')
    increase.click()
    self.assertEqual(driver.find_element_by_tag_name('h1').text,'1')
    self.driver.refresh()
    
  def test_decrease(self):
    driver = self.driver
    driver.get(self.base_url)
    decrease = driver.find_element_by_id('decrease')
    decrease.click()
    self.assertEqual(driver.find_element_by_tag_name('h1').text,'-1')
    self.driver.refresh()
    
  def test_multiple_increase(self):
    driver = self.driver
    driver.get(self.base_url)
    increase = driver.find_element_by_id('increase')
    for i in range(3):
      increase.click()
    self.assertEqual(driver.find_element_by_tag_name('h1').text,'3')
    self.driver.refresh()

  '''
  def tearDown(self):
    try:
      self.driver.refresh()
    except ConnectionRefusedError as e:
      print(e)
    finally:
      self.assertEqual([], self.verificationErrors)
  '''

if __name__ == "__main__":
  unittest.main()
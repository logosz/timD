require 'selenium-webdriver'
require 'appium_lib'

opts = {
        caps: {
            platformName: :android,
            #app: 'F:\app\and_b\GUApps_1.0.apk',
            deviceName: '3bc289280904',
            appPackage: 'com.example.putrimakislan.binar',
            appActivity: '.HomeActivity',
              },
            appium_lib: {
              wait_timeout: 30,
              wait_interval: 1
            }
        }

        appium_driver = Appium::Driver.new(opts, true)

Given("I Launch successfully") do
     appium_driver.start_driver
     sleep(2)
end

Given("I input username") do
     appium_driver.find_element(:id=>('com.example.putrimakislan.binar:id/edtEmail')).send_keys('vaisravana.bishamon@gmail.com')
     sleep(2)
end

Given("I input password") do
  appium_driver.find_element(:id=>('com.example.putrimakislan.binar:id/edtPassword')).send_keys('greg')
  sleep(2)
end

Given("I tap login button") do
  appium_driver.back
  sleep(1)
  appium_driver.find_element(:id=>('com.example.putrimakislan.binar:id/btnLogin')).click
  sleep(2)
end

Then("I should success Login") do
  rt = appium_driver.find_elements(:xpath=>'//android.widget.ImageView[@content-desc="More options"]').size
  if rt > 0
       print 'Login success'
   else
     print 'Login Fail'
   end
  sleep(2)

end

Given("I on homepage") do
  appium_driver.find_element(:xpath=>'//*[@resource-id="com.example.putrimakislan.binar:id/icon" and @instance=2]').click
  sleep(2)
   appium_driver.find_element(:id=>'com.example.putrimakislan.binar:id/foto_profile').displayed?
     sleep(2)
end

Given("I tap hamburger menu") do
  appium_driver.find_element(:xpath=>'//android.widget.ImageView[@content-desc="More options"]').click
  sleep(2)
end

Given("I tap logout button") do
  appium_driver.find_element(:xpath=>'//*[@text="Logout" and @instance=1]').click
  sleep(2)
  appium_driver.find_element(:id=>'android:id/button1').click
  sleep(2)
end

Then("I should logged out") do
  appium_driver.find_element(:id=>'com.example.putrimakislan.binar:id/btnLogin').displayed?
end

Given("I go to Promo page") do
  appium_driver.find_element(:id=>'com.example.putrimakislan.binar:id/promo').click
  sleep(2)
end

Given("I move to kamus page") do
  appium_driver.find_element(:id=>'com.example.putrimakislan.binar:id/kamus').click
  sleep(2)
end

Given("I move to notifikasi page") do
  appium_driver.find_element(:id=>'com.example.putrimakislan.binar:id/notifikasi').click
  sleep(3)
end

Given("I move to bantuan page") do
  appium_driver.find_element(:id=>'com.example.putrimakislan.binar:id/bantuan').click
  sleep(2)
end

Then("I go back to home page") do
  appium_driver.find_element(:id=>'com.example.putrimakislan.binar:id/beranda').click
  sleep(3)
end

After do |scenario|
if scenario.failed?
  i = "_#{Time.now.strftime('%Y-%m-%d_%H.%M.%S')}.png"
  appium_driver.screenshot('I:\trening\QA\mobil\screenshot\fail'+ i +'')
  sleep(3)
end
end

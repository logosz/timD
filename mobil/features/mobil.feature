Feature: Mobil mobilan test

@Login
Scenario: Login app GUA
Given I Launch successfully
Given I input username
Given I input password
Given I tap login button
Then I should success Login

@CheckNav
Scenario: Check navigation button
Given I on homepage
Given I go to Promo page
And I move to kamus page
And I move to notifikasi page
And I move to bantuan page
Then I go back to home page

@Logout
Scenario: Logout app GUA
Given I on homepage
Given I tap hamburger menu
Given I tap logout button
Then I should logged out

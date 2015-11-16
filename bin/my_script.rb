require 'addressable/uri'
require 'rest-client'

def create_user
url = Addressable::URI.new(
  scheme: 'http',
  host: 'localhost',
  port: 3000,
  path: '/users.json'
).to_s

puts RestClient.post(url, {user: {username: "Gizom III"}})
end

def destroy_user
url = Addressable::URI.new(
  scheme: 'http',
  host: 'localhost',
  port: 3000,
  path: '/users/1.json'
).to_s

puts RestClient.delete(url)
end

def update_user
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/users/2.json'
  ).to_s

  puts RestClient.patch(url, {user: {name: "Gizom Jr."}})
end

#contacts

def create_contact
url = Addressable::URI.new(
  scheme: 'http',
  host: 'localhost',
  port: 3000,
  path: '/contacts.json'
).to_s

puts RestClient.post(url, {contact: {name: "Gizom Sr.", email: "giz@giz.giz", user_id: 1}})
end

def destroy_contact
url = Addressable::URI.new(
  scheme: 'http',
  host: 'localhost',
  port: 3000,
  path: '/contacts/2.json'
).to_s

puts RestClient.delete(url)
end

def update_contact
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/contacts/2.json'
  ).to_s

  puts RestClient.patch(url, {contact: {name: "Gizom Jr."}})
end

# Contact Shares

def create_contact_share
url = Addressable::URI.new(
  scheme: 'http',
  host: 'localhost',
  port: 3000,
  path: '/contact_shares.json'
).to_s

puts RestClient.post(url, {contact_share: {user_id: 2, contact_id: 2}})
end

def destroy_contact_share
url = Addressable::URI.new(
  scheme: 'http',
  host: 'localhost',
  port: 3000,
  path: '/contact_shares/2.json'
).to_s

puts RestClient.delete(url)
end


destroy_contact_share

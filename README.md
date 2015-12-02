# tapped-out
Ruby client gem for the api of tapped-out.net

## Authorisation
Some request require a session token. This session token can be found in the *tapped* cookie after you are logged in. This session token can be set as follows:
```ruby
TappedOut::Environment.session_token = 'QWERTY123456'
```
## Latest decks
```ruby
TappedOut::API.latest_decks
```
## Featured decks
```ruby
TappedOut::API.featured_decks
```
## Deck list
This request requires a session token
```ruby
TappedOut::API.deck_list('deck_name')
```

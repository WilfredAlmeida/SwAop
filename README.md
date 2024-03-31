# SwAop

SwAop is a crypto swapping chatroom built on Ao. It allows users to query live prices, find pools and build swap transactions.

Users can:
1. Query price of a token. For eg. ETH/USD
2. Find a swap route for tokens swap
3. Get a swap transaction to sign and execute
4. Broadcat their views to other chatroom members

SwAop uses the 0rbit process to make API calls.

The coin prices are queries form the CoinMarketCap API  

The swap routes and transactions are queried from the Jupiter v6 Swap API

## Flow
1. User registers and joins a chatroom and asks for a token price. For eg. Ethereum(ETH) token
2. SwAop calls the 0rbit process to make the GET API call
3. 0rbit calls the CoinMarketCap API and gets prices for the tokes and returns it to SwAop
4. SwAop returns the prices to the user
5. User wishes to do a token swap and asks SwAop to find a pool for a pool and route
6. Via 0rbit, SwAop queries the Jupiter v6 API to find it and returns it to the user
7. User finds the route good enough and asks SwAop for a swap transaction to send to the blockchain. SwAop again queries the Jupiter API and returns the constructed transaction to the user which the user can execute by themselves
8. If the users want to share their thoughts/analysis or ask any doubts, the can send broadcat messages to all the users in the chatroom and communicate


## Handlers
1. Register: Registers a user to the chatroom
2. Broadcast: Send messages to chat with other users
3. `GetETHPrice`: Get price of the ETH token in USD
4. `GetQuote`: Get quote price, route, pool for a token swap
5. `GetSwapTx`: Get a swap transaction to execute on the blockchain
# SwAop

SwAop is a crypto swapping chatroom built on Ao. It allows users to query live prices, find pools and build swap transactions.

Users can:
1. Query price of a token. For eg. ETH/USD
2. Find a swap route for tokens swap
3. Get a swap transaction to sign and execute
4. Broadcat their views to other chatroom members

## Flow
![ethmumbai drawio](https://github.com/WilfredAlmeida/SwAop/assets/60785452/d4d2bdf7-171e-4b70-b0b1-87365e4a5105)

1. User registers and joins a chatroom and asks for a token price. For eg. Ethereum(ETH) token
2. SwAop calls the 0rbit process to make the GET API call
3. 0rbit calls the CoinMarketCap API and gets prices for the tokes and returns it to SwAop
4. SwAop returns the prices to the user
5. User wishes to do a token swap and asks SwAop to find a pool for a pool and route
6. Via 0rbit, SwAop queries the Jupiter v6 API to find it and returns it to the user
7. User finds the route good enough and asks SwAop for a swap transaction to send to the blockchain. SwAop again queries the Jupiter API and returns the constructed transaction to the user which the user can execute by themselves
8. If the users want to share their thoughts/analysis or ask any doubts, the can send broadcat messages to all the users in the chatroom and communicate


## Handlers
1. `Register`: Registers a user to the chatroom
2. `Broadcast`: Send messages to chat with other users
3. `GetETHPrice`: Get price of the ETH token in USD
4. `GetQuote`: Get quote price, route, pool for a token swap
5. `GetSwapTx`: Get a swap transaction to execute on the blockchain

## Images
1. Members list
![members](https://github.com/WilfredAlmeida/SwAop/assets/60785452/00f27fb4-9185-498b-934b-a360462563af)

2. Token Price
![price](https://github.com/WilfredAlmeida/SwAop/assets/60785452/df93ff9c-c582-4dce-8661-4136428d4e62)

3. Route & Pool
![route](https://github.com/WilfredAlmeida/SwAop/assets/60785452/a04f87ac-8d8f-49b6-864a-1d724586d1e0)

4. Swap Transaction
![swaptx](https://github.com/WilfredAlmeida/SwAop/assets/60785452/2b3292cb-3e68-424b-90cb-940f1aaa6c4a)

5. Chat Broadcast
![broadcast](https://github.com/WilfredAlmeida/SwAop/assets/60785452/92e4ca53-3ef2-4d79-b2c9-cda64807afbf)





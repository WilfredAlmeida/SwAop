local json = require("json")
local base64 = require(".base64")

Members = Members or {}
_0RBIT = "WSXUI2JjYUldJ7CKq9wE1MGwXs-ldzlUlHOQszwQe0s"

Handlers.add("Register", Handlers.utils.hasMatchingTag("Action", "Register"),
             function(msg)
    table.insert(Members, msg.From)
    Handlers.utils.reply("registered")(msg)
end)

Handlers.add("Broadcast", Handlers.utils.hasMatchingTag("Action", "Broadcast"),
             function(msg)
    for _, recipient in ipairs(Members) do
        ao.send({Target = recipient, Data = msg.Data})
    end
    Handlers.utils.reply("Broadcasted.")(msg)
end)

Handlers.add("GetETHPrice",
             Handlers.utils.hasMatchingTag("Action", "GetBTCPrice"),
             function(msg)
    ao.send({
        Target = _0RBIT,
        Action = "Get-Real-Data",
        Url = "https://pro-api.coinmarketcap.com/v2/cryptocurrency/quotes/latest?CMC_PRO_API_KEY=ba21e08c-526d-4ab2-8bea-8f73c1a2ce8e&id=1027"
    })
    decoded = json.decode(Inbox[#Inbox].Data)
    print(decoded)
    Handlers.utils.reply(decoded)(msg)
end)

Handlers.add("GetQuote", Handlers.utils.hasMatchingTag("Action", "GetQuote"),
             function(msg)
    ao.send({
        Target = _0RBIT,
        Action = "Get-Real-Data",
        Url = "https://quote-api.jup.ag/v6/quote?inputMint=So11111111111111111111111111111111111111112&outputMint=EPjFWdd5AufqSSqeM2qN1xzybapC8G4wEGGkZwyTDt1v&amount=1000000&slippageBps=1"
    })
    decoded = json.decode(Inbox[#Inbox].Data)
    print(decoded)
    Handlers.utils.reply(decoded)(msg)
end)

Handlers.add("GetSwapTx", Handlers.utils.hasMatchingTag("Action", "GetSwapTx"),
             function(msg)
    encodedJson = json.encode({
        inputMint = "So11111111111111111111111111111111111111112",
        inAmount = '100000000',
        outputMint = 'EPjFWdd5AufqSSqeM2qN1xzybapC8G4wEGGkZwyTDt1v',
        outAmount = '19718073',
        otherAmountThreshold = '19619483',
        swapMode = 'ExactIn',
        slippageBps = 50,
        platformFee = null,
        priceImpactPct = '0',
        routePlan = {
            {
                swapInfo = {
                    ammKey = 'HktfL7iwGKT5QHjywQkcDnZXScoh811k7akrMZJkCcEF',
                    label = 'Whirlpool',
                    inputMint = 'So11111111111111111111111111111111111111112',
                    outputMint = '7vfCXTUXx5WJV5JADk17DUJ4ksgau7utNKj4b963voxs',
                    inAmount = '100000000',
                    outAmount = '558845',
                    feeAmount = '5',
                    feeMint = 'So11111111111111111111111111111111111111112'
                },
                percent = 100
            }, {
                swapInfo = {
                    ammKey = '9cGUdTiSGsP9Du3NXHhkxK7fbNT4pL543yZH4bUatR1v',
                    label = 'Raydium CLMM',
                    inputMint = '7vfCXTUXx5WJV5JADk17DUJ4ksgau7utNKj4b963voxs',
                    outputMint = '7dHbWXmci3dT8UFYWYZweBLXgycu7Y3iL6trKn1Y7ARj',
                    inAmount = '558845',
                    outAmount = '85308510',
                    feeAmount = '1176',
                    feeMint = '7vfCXTUXx5WJV5JADk17DUJ4ksgau7utNKj4b963voxs'
                },
                percent = 100
            }, {
                swapInfo = {
                    ammKey = 'HPmjoycx8Vm99Tc9mUhRZWfJy4fsEZxVwhzP5nw7XeEy',
                    label = 'Lifinity V2',
                    inputMint = '7dHbWXmci3dT8UFYWYZweBLXgycu7Y3iL6trKn1Y7ARj',
                    outputMint = 'EPjFWdd5AufqSSqeM2qN1xzybapC8G4wEGGkZwyTDt1v',
                    inAmount = '85308510',
                    outAmount = '19718073',
                    feeAmount = '17061',
                    feeMint = '7dHbWXmci3dT8UFYWYZweBLXgycu7Y3iL6trKn1Y7ARj'
                },
                percent = 100
            }
        },
        contextSlot = 257454864,
        timeTaken = 0.005118779
    })
    ao.send({
        Target = _0RBIT,
        Action = "Post-Real-Data",
        Url = "https://quote-api.jup.ag/v6/swap",
        Body = json.encode({
            quoteResponse = json.decode(encodedJson),
            userPublicKey = "9Y6R2jNUPQAt4r8ei56bam7GCWZkEWqVYEXKTdA5e5Ya",
            wrapAndUnwrapSol = true
        })
    })
    decoded = json.decode(Inbox[#Inbox].Data)
    print(decoded)
    Handlers.utils.reply(decoded)(msg)
end)


express = require 'express'
cookieParser = require('cookie-parser')
app = express()


app.use (req, res, next) ->
	res.header("Access-Control-Allow-Origin", "*")
	res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept")


	console.log req.headers

	next()

app.use cookieParser()

app.use (req, res, next) ->
	value = 1
	if val = req.cookies?.value
		value = parseInt(val, 10) || value
		value += 1

	res.cookie 'value', value ,
		expires: new Date(Date.now() + 900000)
		httpOnly: true

	req.value = value
	next()



app.get '/', (req, res, next) ->
	res.send "Hello World! #{req.value}"

app.listen 3000, ->
	console.log('Example app listening on port 3000!')

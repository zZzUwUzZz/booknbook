var api_key = 'key-02898c1623290dd7927fdc6fd18bfbab';
var domain = 'sandboxd288024e6d43411e9708c0fe640a3819.mailgun.org';
var mailgun = require('mailgun-js')({apiKey: api_key, domain: domain});
 
var data = {
  from: 'Admin <ntop1996@gmail.com>',
  to: 'worne13@gmail.com',
  subject: 'Hello',
  text: 'Testing some Mailgun awesomeness!'
};
 
mailgun.messages().send(data, function (error, body) {
    if(error){
        console.log(error);
    }
  console.log(body);
});

// const formData = require('form-data');
// const Mailgun = require('mailgun.js');
// const mailgun = new Mailgun(formData);
// const mg = mailgun.client({username: 'api', key: process.env.MAILGUN_API_KEY || 'key-yourkeyhere'});

// mg.messages.create('sandbox-123.mailgun.org', {
// 	from: "Excited User <mailgun@sandbox-123.mailgun.org>",
// 	to: ["test@example.com"],
// 	subject: "Hello",
// 	text: "Testing some Mailgun awesomeness!",
// 	html: "<h1>Testing some Mailgun awesomeness!</h1>"
// })
// .then(msg => console.log(msg)) // logs response data
// .catch(err => console.log(err)); // logs any error
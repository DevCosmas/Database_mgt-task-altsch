// ENTITIES/COLLECTION CREATION
db.createCollection("USER")
db.createCollection("PRODUCT")
db.createCollection("ADMIN")
db.createCollection("ADMIN_PRODUCT")
db.createCollection("ORDERED_PRODUCT")
db.createCollection("ORDER")
db.createCollection("CATEGORY")
db.createCollection("PAYMENT")
db.createCollection("SHIPMENT")
db.createCollection("FEEDBACK")


// INSERTING RECORDS
db.USER.insertOne({ name: 'Cosmas', email: "name@gmail.com", password: '12345***', phone: "+234", gender: "male", address: 'earth', zip_code: 1111, role: 'Admin', _id: 1 })
db.ADMIN.insertOne({ user_id: 1, token: 'Cosmas12345****', _id: 1 })
db.PRODUCT.insertOne({ name: 'Prada gallerie', size: 'medium', category_id: 2, description: 'A high quality prada bag', quantity: 4, price: 500, _id: 1, createdAt: Date() })
  

// GETTING RECORDS
db.USER.findOne({_id:1}) //returns one user with _id:1
db.ADMIN.findOne({token:'Cosmas12345****'}) //returns one Admin with token:Cosmas12345****
db.PRODUCT.find({size:"medium"}) // return all product with size: medium


// UPDATING RECORDS
db.USER.updateOne({_id:1},{$set:{address:"moon"}}) //updates one user"s address:moon, where _id: 1
db.ADMIN.updateOne({_id:1}, {$set:{token:"*****"}}) //updates one admin token where _id:1
db.PRODUCT.updateMany({size:'medium'},{$set:{size:"big"}}) //update all product with size:medium to size:big


// DELETING RECORDS
db.USER.deleteOne({_id:1}) // deletes user where _id:1
db.ADMIN.deleteOne({_id:1}) // deletes admin where _id:1
db.PRODUCT.deleteMany({size:'big'}) //delete all product with the size:big

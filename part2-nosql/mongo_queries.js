// OP1: insertMany() — insert all 3 documents
db.products.insertMany([
  {
    product_id: "E101",
    name: "Smartphone",
    category: "Electronics",
    price: 35000,
    brand: "Samsung",
    specifications: {
      warranty_years: 2,
      battery: "5000mAh",
      voltage: "220V"
    },
    tags: ["mobile", "android", "5G"]
  },
  {
    product_id: "C201",
    name: "Men's Jacket",
    category: "Clothing",
    price: 2500,
    brand: "Zara",
    size: ["S","M","L","XL"],
    material: "Polyester",
    season: "Winter"
  },
  {
    product_id: "G301",
    name: "Organic Milk",
    category: "Groceries",
    price: 60,
    brand: "Amul",
    expiry_date: new Date("2024-12-31"),  
    nutrition: {
      calories: 150,
      protein: "8g",
      fat: "5g"
    },
    is_organic: true
  }
]);

// OP2: find() — retrieve all Electronics products with price > 20000
db.products.find({
  category: "Electronics",
  price: { $gt: 20000 }
});

// OP3: find() — retrieve all Groceries expiring before 2025-01-01
db.products.find({
  category: "Groceries",
  expiry_date: { $lt: new Date("2025-01-01") } 
});

// OP4: updateOne() — add discount_percent field to a specific product
db.products.updateOne(
  { product_id: "E101" },
  { $set: { discount_percent: 10 } }
);

// OP5: createIndex() — create index on category field

db.products.createIndex({ category: 1 });
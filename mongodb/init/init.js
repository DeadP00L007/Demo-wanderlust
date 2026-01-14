db = db.getSiblingDB("wanderlust");

db.posts.insertOne({
  title: "Init OK",
  content: "Mongo initialized via Dockerfile"
});

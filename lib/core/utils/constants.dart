const String appwriteProjectId = "646f0c98ccb28fb2fe49";
const String appwriteEndpoint = "https://cloud.appwrite.io/v1";
const String databaseId = "646f62166f1fe65cde91";
const String collectionId = "646f6265cd8aed1de94b";
const String postCollectionId = "6477832e4c73ece2455a";
const String postStorageId = "6473496b9748cefb57d4";
String imageUrl(String imageId) => "https://cloud.appwrite.io/v1/storage/buckets/$postStorageId/files/$imageId/view?project=$appwriteProjectId&mode=admin";
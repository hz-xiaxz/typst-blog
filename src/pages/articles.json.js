import { getCollection } from "astro:content";

export async function GET() {
  const rawPosts = await getCollection("blog");

  // only export specified fields
  const posts = rawPosts.map((post) => ({
    id: post.id,
    collection: post.collection,
    data: {
      title: post.data.title,
      date: post.data.date,
    },
  })).sort(
    (a, b) => new Date(b.data.date).getTime() - new Date(a.data.date).getTime()
  );

  return Response.json(posts);
}

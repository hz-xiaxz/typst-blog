import { renderPdf } from '$components/Typst';
import { kSiteTitle } from '$consts';
import type { APIRoute } from 'astro';
import { getCollection } from 'astro:content';

export const getStaticPaths = async () => {
  const blogPosts = await getCollection('blog');

  const articlesByYear = new Map<number, any[]>();

  for (const post of blogPosts) {
    const year = post.data.date.getFullYear();

    if (!articlesByYear.has(year)) {
      articlesByYear.set(year, []);
    }

    articlesByYear.get(year)!.push(post);
  }

  const paths = [];

  for (const [year, articles] of articlesByYear) {
    articles.sort((a, b) => b.data.date.getTime() - a.data.date.getTime());

    paths.push({
      params: { slug: year.toString() },
      props: { year, articles }
    });
  }
  return paths;
};

export const GET: APIRoute = async ({ params, props }) => {
  const { year, articles } = props;

  const typstContent = generateArchiveTypst(year, articles);

  try {
    const pdfBuffer = await renderPdf(typstContent);

    return new Response(pdfBuffer, {
      status: 200,
      headers: {
        'Content-Type': 'application/pdf',
        'Content-Disposition': `inline; filename="blog-archive-${year}.pdf"`,
      },
    });
  } catch (error) {
    console.error('Error generating PDF:', error);
    return new Response('Error generating PDF', { status: 500 });
  }
};

function generateArchiveTypst(year: number, articles: any[]) {
  const indices = articles.map(a => `    "${a.id}"`).join(',\n');
  const typstSafeIndices = articles.length > 0 ? `${indices},` : '';

  const includes = articles.map(a =>
    `#include "/content/article/${a.id}.typ"\n#pagebreak(weak: true)`
  ).join('\n\n');

  const currentDate = new Date().toISOString().split('T')[0];

  return `#import "/typ/templates/monthly.typ": *

#show: main.with(
  title: "${kSiteTitle} ${year}",
  desc: [Archive of Blog posts in ${year}],
  date: "${currentDate}",
  tags: (
    archive-tags.blog-post,
  ),
  archive-indices: (
${typstSafeIndices}
  ),
)

${includes}`;
}

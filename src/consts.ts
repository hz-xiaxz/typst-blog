// Place any global data in this file.
// You can import this data from anywhere in your site by using the `import` keyword.

import * as config from "astro:env/client";

/**
 * Whether to enable comment posting and viewing.
 */
export const kEnableComment = true;
/**
 * Whether to enable like reaction.
 */
export const kEnableReaction = true && kEnableComment;

/**
 * The name of the owner of the website.
 */
export const kSiteOwner = config.SITE_OWNER;
/**
 * The title of the website.
 */
export const kSiteTitle = config.SITE_TITLE;
/**
 * The title of the website, used in the index page.
 */
export const kSiteIndexTitle = config.SITE_INDEX_TITLE;
/**
 * The description of the website.
 */
export const kSiteDescription = config.SITE_DESCRIPTION;

/**
 * The URL base of the website.
 * - For a GitHub page `https://username.github.io/repo`, the URL base is `/repo/`.
 * - For a netlify page, the URL base is `/`.
 */
export const kUrlBase = (config.URL_BASE || "").replace(/\/$/, "");


/**
 * giscus config.
 */
export const kGiscusConfig = {
  repo: "hz-xiaxz/blog-content",
  repoId: "R_kgDOOzmTGQ",
  category: "General",
  categoryId: "DIC_kwDOOzmTGc4Cx0jT",
  enableReaction: kEnableReaction,
};

/**
 * The friend link info.
 */
export const kFriendLinks = [
  {
    name: "Wentao Li",
    url: "https://wentaoli.xyz/",
    icon: "ri:global-fill",
    desc: "The Knowledge Garden of Wentao Li",
},
];


/**
 * The social links info.
 */
export const kSocialLinks = [
  {
    name: "GitHub",
    url: "https://github.com/hz-xiaxz",
    icon: "ri:github-fill",
  },
];


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

export const kBingSIteVerification = config.BING_SITE_VERIFICATION;
export const kGoogleSiteVerification = config.GOOGLE_SITE_VERIFICATION;

/**
 * The friend link info.
 */
export const kFriendLinks = [
  {
    name: "sjfh's Homepage",
    url: "https://sjfh.top/",
    desc: "无问西东.",
  },
  {
    name: "JrHimself",
    url: "https://www.jrhim.com/",
    desc: "融雪之前, 牧神搭上春色的火车, 而日光在我们之间.",
  },
];


/**
 * The social links info.
 */
export const kSocialLinks = [
  {
    name: "GitHub",
    url: "https://github.com/paran3xus",
    icon: "ri:github-fill",
  },
  {
    name: "Telegram",
    url: "https://t.me/paran3xus",
    icon: "ri:telegram-fill",
  },
];


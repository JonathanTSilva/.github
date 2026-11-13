import { expect, test } from "@playwright/test";

test("renders a heading", async ({ page }) => {
  await page.goto("data:text/html,<h1>Hello</h1>");
  await expect(page.getByRole("heading", { name: "Hello" })).toBeVisible();
});

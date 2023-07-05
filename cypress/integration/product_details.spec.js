describe('Jungle', () => {
  beforeEach(() => {
    cy.visit('/')
  })

  it("shows products on the page", () => {
    cy.get(".products article").should("be.visible");
  });

  it("shows 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });

  it('navigates from the home page to the product detail page when a product is clicked', () => {
    cy.get(".products article")
      .first()
      .click()
    cy.get(".product-detail").should("be.visible");
  });
})

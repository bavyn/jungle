describe('Product Details', () => {
  it('navigates from the home page to the product detail page when a product is clicked', () => {
    cy.visit('/')
    cy.get(".products article").should("be.visible")
    cy.get(".products article").should("have.length", 2)

    cy.get(".products article")
      .first()
      .click()
    cy.get(".product-detail").should("be.visible")
  });
})

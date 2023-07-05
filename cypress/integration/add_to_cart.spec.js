describe('Cart', () => {
  beforeEach(() => {
    cy.visit('/')
    cy.get(".products article").should("be.visible")
    cy.get(".products article").should("have.length", 2)
  })

  it("should have an empty cart", () => {
    cy.get('a[href*="cart"]').contains('0')
  });

  it("should click Add on a product and increase the cart by 1", () => {
    cy.get('button[type=submit]')
      .first()
      .click({ force: true })
    cy.get('a[href*="cart"]').contains('1');
  })
})

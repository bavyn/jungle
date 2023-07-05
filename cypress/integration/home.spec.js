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
})

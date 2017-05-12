require('spec_helper')

describe(Brand)do
  describe('#stores') do
    it('returns an array of stores associated with this brand object') do
      brand1 = Brand.create({
        :name=>'brand1',
        :price=>50.00
      })
      store1 = brand1.stores.create({:name=>'name'})
      store2 = brand1.stores.create({:name=>'name'})
      expect(brand1.stores).to(eq([store1, store2]))
    end
  end
end

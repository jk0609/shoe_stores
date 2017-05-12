require('spec_helper')

describe(Store)do
  describe('#brands') do
    it('returns an array of brands associated with this store object') do
      store1 = Store.create({:name=>'store1'})
      brand1 = store1.brands.create({:name=>'name', :price=>50.00})
      brand2 = store1.brands.create({:name=>'name', :price=>50.00})
      expect(store1.brands).to(eq([brand1, brand2]))
    end

    it("validates presence of description") do
      store1 = Store.new({:name => ""})
      expect(store1.save()).to(eq(false))
    end

  end
end

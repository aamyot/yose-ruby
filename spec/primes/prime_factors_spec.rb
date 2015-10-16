require './app/primes/prime_factors'

RSpec.describe 'Prime Factors' do

  it 'returns empty for number lower than 2' do
    expect(PrimeFactors.of(1)).to be_empty
  end

  it 'decomposes 2' do
    expect(PrimeFactors.of(2)).to eq [2]
  end

  it 'decomposes 4' do
    expect(PrimeFactors.of(4)).to eq [2, 2]
  end

  it 'decomposes 32' do
    expect(PrimeFactors.of(32)).to eq [2, 2, 2, 2, 2]
  end

  it 'decomposes 25' do
    expect(PrimeFactors.of(25)).to eq [5,5]
  end

  it 'decomposes 50' do
    expect(PrimeFactors.of(50)).to eq [2,5,5]
  end

end
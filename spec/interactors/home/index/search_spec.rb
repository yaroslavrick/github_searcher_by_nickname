# frozen_string_literal: true

RSpec.describe Home::Index::Search do
  describe '.call' do
    subject(:result) { described_class.call(name:) }

    context 'when valid params', vcr: { cassette_name: 'github/search_valid' } do
      let(:name) { 'dhh' }

      it_behaves_like 'success'
      it_behaves_like 'semantic status', 200
      it_behaves_like 'no errors'

      it 'has github user name' do
        expect(result.user_name).to eq 'David Heinemeier Hansson'
      end

      it 'has github user repos' do
        expect(result.user_repos).to be_a(Array)
      end
    end

    context 'when invalid params', vcr: { cassette_name: 'github/search_invalid' } do
      context 'when name is empty' do
        let(:name) { '' }

        it_behaves_like 'failure'
        it_behaves_like 'semantic status', 404
      end

      context 'when name is missing' do
        let(:name) { nil }

        it_behaves_like 'failure'
        it_behaves_like 'semantic status', 404
      end

      context 'when no GH_TOKEN' do
        let(:name) { 'dhh' }

        before do
          stub_const('Home::Index::Search::GH_TOKEN', nil)
        end

        it_behaves_like 'failure'
        it_behaves_like 'semantic status', 422
      end

      context 'when Faraday error occurs' do
        let(:name) { 'dhh' }

        before do
          allow(Faraday).to receive(:get).and_raise(Faraday::Error, 'error')
        end

        it_behaves_like 'failure'
        it_behaves_like 'semantic status', 422
        it_behaves_like 'error message', 'Network Error: error'
      end

      context 'when JSON parse error occurs' do
        let(:name) { 'dhh' }

        before do
          allow(JSON).to receive(:parse).and_raise(JSON::ParserError, 'error')
        end

        it_behaves_like 'failure'
        it_behaves_like 'semantic status', 422
        it_behaves_like 'error message', 'JSON Parsing Error: error'
      end
    end
  end
end

module Api
    module V1
        class ProposalsController < ApplicationController   
            def index
                proposals = Proposal.order('created_at DESC');
                render json: {status: 'SUCCESS', message:'Propostas carregadas', data:proposals},status: :ok
            end

            def show
				proposal = Proposal.find(params[:id])
				render json: {status: 'SUCCESS', message:'Proposta carregada', data:proposal},status: :ok
			end
        end
    end
end
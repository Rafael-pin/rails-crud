module Api
    module V1
        class ProposalsController < ApplicationController   
            skip_before_action :verify_authenticity_token

            def index
                proposals = Proposal.order('created_at DESC');
                render json: {status: 'SUCCESS', message:'Loaded proposals', data:proposals},status: :ok
            end

            def show
				proposal = Proposal.find(params[:id])
				render json: {status: 'SUCCESS', message:'Loaded proposal', data:proposal},status: :ok
			end

            def create
				proposal = Proposal.new(proposal_params)
				if proposal.save
					render json: {status: 'SUCCESS', message:'Saved proposal', data:proposal},status: :ok
				else
					render json: {status: 'ERROR', message:'Proposal not saved', data:proposal.errors},status: :unprocessable_entity
				end
			end

            def destroy
				proposal = Proposal.find(params[:id])
				proposal.destroy
				render json: {status: 'SUCCESS', message:'Deleted proposal', data:proposal},status: :ok
			end

            def update
				proposal = Proposal.find(params[:id])
				if proposal.update_attributes(proposal_params)
					render json: {status: 'SUCCESS', message:'Updated proposal', data:proposal},status: :ok
				else
					render json: {status: 'ERROR', message:'Proposal not updated', data:proposal.errors},status: :unprocessable_entity
				end
			end

            private
			def proposal_params
				params.permit(:name, :description, :value, :start_date, :end_date)
			end

        end
    end
end
# Copyright 2020 Pixar

#
#    Licensed under the Apache License, Version 2.0 (the "Apache License")
#    with the following modification; you may not use this file except in
#    compliance with the Apache License and the following modification to it:
#    Section 6. Trademarks. is deleted and replaced with:
#
#    6. Trademarks. This License does not grant permission to use the trade
#       names, trademarks, service marks, or product names of the Licensor
#       and its affiliates, except as required to comply with Section 4(c) of
#       the License and to reproduce the content of the NOTICE file.
#
#    You may obtain a copy of the Apache License at
#
#        http://www.apache.org/licenses/LICENSE-2.0
#
#    Unless required by applicable law or agreed to in writing, software
#    distributed under the Apache License with the above modification is
#    distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
#    KIND, either express or implied. See the Apache License for the specific
#    language governing permissions and limitations under the Apache License.
#
#

module Jamf

  # The device re-enrollment settings for the Jamf Pro Server
  #
  class ReEnrollmentSettings < Jamf::SingletonResource

    # Mix-Ins
    #####################################

    include Jamf::ChangeLog

    # Constants
    #####################################

    RSRC_VERSION = 'v1'.freeze

    RSRC_PATH = 'reenrollment'.freeze

    FLUSH_MDM_QUEUE_NOTHING = 'DELETE_NOTHING'.freeze
    FLUSH_MDM_QUEUE_ERRORS = 'DELETE_ERRORS'.freeze
    FLUSH_MDM_QUEUE_NOT_ACKD = 'DELETE_EVERYTHING_EXCEPT_ACKNOWLEDGED'.freeze
    FLUSH_MDM_QUEUE_EVERYTHING = 'DELETE_EVERYTHING'.freeze

    FLUSH_MDM_QUEUE_OPTIONS = [
      FLUSH_MDM_QUEUE_NOTHING,
      FLUSH_MDM_QUEUE_ERRORS,
      FLUSH_MDM_QUEUE_NOT_ACKD,
      FLUSH_MDM_QUEUE_EVERYTHING
    ].freeze

    OBJECT_MODEL = {

      # @!attribute isFlushPolicyHistoryEnabled
      #   @return [Boolean]
      isFlushPolicyHistoryEnabled: {
        class: :boolean
      },

      # @!attribute isFlushLocationInformationEnabled
      #   @return [Boolean]
      isFlushLocationInformationEnabled: {
        class: :boolean
      },

      # @!attribute isFlushLocationInformationHistoryEnabled
      #   @return [Boolean]
      isFlushLocationInformationHistoryEnabled: {
        class: :boolean
      },

      # @!attribute isFlushExtensionAttributesEnabled
      #   @return [Boolean]
      isFlushExtensionAttributesEnabled: {
        class: :boolean
      },

      # @!attribute flushMDMQueue
      #   @param [Symbol] a key from ReEnrollment::FLUSH_MDM_QUEUE_OPTIONS
      #   @return [Symbol]
      flushMDMQueue: {
        class: :string,
        enum: FLUSH_MDM_QUEUE_OPTIONS
      }

    }.freeze # end OBJECT_MODEL
    parse_object_model

  end # class ReEnrollment

end # module JAMF

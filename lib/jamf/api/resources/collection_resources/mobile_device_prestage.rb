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

# The Module
module Jamf

  # Classes
  #####################################

  # A building defined in the JSS
  class MobileDevicePrestage < Jamf::Prestage

    include Jamf::ChangeLog

    # Constants
    #####################################

    RSRC_VERSION = 'v1'.freeze

    RSRC_PATH = 'mobile-device-prestages'.freeze

    # Object Model / Attributes
    # See APIObject class documentation for details
    # of how the OBJECT_MODEL hash works.
    #####################################
    OBJECT_MODEL = superclass::OBJECT_MODEL.merge(

      # @!attribute skipSetupItems
      #   @return [Jamf::ComputerPrestageSkipSetupItems]
      skipSetupItems: {
        class: Jamf::MobileDevicePrestageSkipSetupItems
      },

      # @!attribute isAllowPairing
      #   @return [Boolean]
      isAllowPairing: {
        class: :boolean
      },

      # @!attribute isMultiUser
      #   @return [Boolean]
      isMultiUser: {
        class: :boolean
      },

      # @!attribute isSupervised
      #   @return [Boolean]
      isSupervised: {
        class: :boolean
      },

      # @!attribute maximumSharedAccounts
      #   @return [Integer]
      maximumSharedAccounts: {
        class: :integer
      },

      # @!attribute isAutoAdvanceSetup
      #   @return [Boolean]
      isAutoAdvanceSetup: {
        class: :boolean
      },

      # @!attribute isConfigureDeviceBeforeSetupAssistant
      #   @return [Boolean]
      isConfigureDeviceBeforeSetupAssistant: {
        class: :boolean
      },

      # @!attribute language
      #   @return [String]
      language: {
        class: :string
      },

      # @!attribute region
      #   @return [String]
      region: {
        class: :string
      },

      # @!attribute names
      #   @return [Jamf::MobileDevicePrestageNames]
      names: {
        class: Jamf::MobileDevicePrestageNames
      }
    ).freeze

    parse_object_model

    # Class Methods
    ###############################################

    def self.sync_status(prestage = nil, latest = false, cnx: Jamf.cnx)
      @sync_rsrc ||= "#{self::RSRC_VERSION}/#{self::RSRC_PATH}/#{SYNC_RSRC}"

      if prestage
        id = valid_id prestage
        raise Jamf::NoSuchItemError, "No #{self.class} matching '#{prestage}'" unless id

        rsrc = "#{@sync_rsrc}/#{id}"
        rsrc << '/latest' if latest
        results = cnx.get rsrc
        latest ? Jamf::PrestageSyncStatus.new(results) : results.map { |ss| Jamf::PrestageSyncStatus.new ss }
      else
        cnx.get(@sync_rsrc).map { |ss| Jamf::PrestageSyncStatus.new ss }
      end
    end # self.sync_status(prestage = nil, latest = false, cnx: Jamf.cnx)

    # Instance Methods
    ###############################################

    def sync_status(latest = false)
      self.class.sync_status @id, latest, cnx: @cnx
    end

  end # class

end # module

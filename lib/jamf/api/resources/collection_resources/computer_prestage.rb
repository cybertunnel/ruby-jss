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

  # A Computer Prestage
  class ComputerPrestage < Jamf::Prestage

    # Constants
    #####################################

    RSRC_VERSION = 'v1'.freeze

    RSRC_PATH = 'computer-prestages'.freeze

    # Object Model / Attributes
    # See APIObject class documentation for details
    # of how the OBJECT_MODEL hash works.
    #####################################
    OBJECT_MODEL = superclass::OBJECT_MODEL.merge(

      # @!attribute skipSetupItems
      #   @return [Jamf::ComputerPrestageSkipSetupItems]
      skipSetupItems: {
        class: Jamf::ComputerPrestageSkipSetupItems
      },

      # @!attribute isInstallProfilesDuringSetup
      #   @return [Boolean]
      isInstallProfilesDuringSetup: {
        class: :boolean
      },

      # @!attribute prestageInstalledProfileIds
      #   @return [Array<Integer>]
      prestageInstalledProfileIds: {
        class: :integer,
        multi: true
      },

      # @!attribute customPackageIds
      #   @return [Array<Integer>]
      customPackageIds: {
        class: :integer,
        multi: true
      }
    ).freeze

    parse_object_model

    # Class Methods
    ###############################################

  end # class

end # module

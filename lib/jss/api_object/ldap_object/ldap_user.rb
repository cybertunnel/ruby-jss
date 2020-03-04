module JSS

    class LDAPUser < JSS::LDAPServer

        RSRC_LIST_KEY = :users
        RSRC_OBJECT_KEY = :users

        def self.valid_id(identifier, refresh = false, api: JSS.api)

            return identifier if JSS::LDAPServer.user_in_ldap? identifier, api: api
      
            nil
        end

        def xml_list(array, content)
            JSS.item_list_to_rexml_list self::RSRC_LIST_KEY, self::RSRC_OBJECT_KEY, array, content
        end
    end
end
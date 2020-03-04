module JSS

    class LDAPUserGroup < JSS::LDAPServer

        RSRC_LIST_KEY = :user_groups
        RSRC_OBJECT_KEY = :user_group

        def self.valid_id(identifier, refresh = false, api: JSS.api)

            return identifier if JSS::LDAPServer.group_in_ldap? identifier
      
            nil
        end

        def xml_list(array, content)
            puts "Hello"
            JSS.item_list_to_rexml_list self::RSRC_LIST_KEY, self::RSRC_OBJECT_KEY, array, content
        end
    end
end
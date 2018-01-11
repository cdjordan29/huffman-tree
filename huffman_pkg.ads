pragma assertion_policy(check);
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Tree_Pkg;

package huffman_pkg is
subtype Bit is Character range '0' .. '1';

      -- ASCII String
      subtype A_String is String;

      -- Huffman String
      subtype H_String is String with
         dynamic_predicate => (for all c of H_String => c in Bit);

      -- Readable Huffman String
      subtype RH_String is String with
         dynamic_predicate => (for all c of RH_String => c in Bit | ' ');

      type A_String_Ptr is access A_String;
      type H_String_Ptr is access H_String;

      type Frequency_Table is array (Character) Of Natural;
      type Huffman_Table is array (Character) Of H_String_Ptr;

      type NodeInfo is record
         frequency: Integer;
         letter: Unbounded_String;
      end record;

      function create_freq_table (s : A_String) return Frequency_Table;
      function create_huffman_table (s : A_String) return Huffman_Table;

      function to_huffman (s: A_String; c : Huffman_Table; spaces : Boolean := false) return RH_String;

      function to_huffman (s: A_String; spaces : Boolean := false) return RH_String with
         post => to_huffman'result = to_huffman(s, create_huffman_table(s), spaces)
                 and ((    spaces and to_huffman'result in RH_String) or
                      (not spaces and to_huffman'result in  H_String));

      function to_ascii (s : H_String; ft : Frequency_Table) return A_String with
         post => to_huffman(to_ascii'result, false) = s;

      procedure put(n: NodeInfo);

   package treePackage is new Tree_Pkg(NodeInfo, put);
   use treePackage;

   end huffman_pkg;

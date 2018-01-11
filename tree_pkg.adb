with ada.Text_IO; use ada.Text_IO;
package body tree_pkg is

   ----------------------------------------------------------
   -- Purpose: Checks to see if the given tree is a leaf or not
   -- Parameters: t: Tree
   -- Precondition:
   -- Postcondition:
   ----------------------------------------------------------
   function is_leaf (t: Tree) return Boolean is
      isLeaf: Boolean := false;
   begin

      if t.left = null and t.right = null then
         isLeaf := true;
      end if;

      return isLeaf;
   end is_leaf;

   ----------------------------------------------------------
   -- Purpose: Checks to see if the given tree is empty
   -- Parameters: t: Tree
   -- Precondition:
   -- Postcondition:
   ----------------------------------------------------------
   function is_empty (t: Tree) return Boolean is
      isEmpty: Boolean := false;
   begin

      if t = null then
         isEmpty := true;
      end if;

      return isEmpty;
   end is_empty;

   ----------------------------------------------------------
   -- Purpose: Constructs a new tree based on the given parameters
   -- Parameters: i: Item_Type; l, r: Tree;
   -- Precondition:
   -- Postcondition:
   ----------------------------------------------------------
   function new_tree (i: Item_Type; l, r: Tree) return Tree is
      newTree: Tree := new TreeNode;
   begin

      newTree.all.left := l;
      newTree.all.right := r;
      newTree.all.data := i;

      return newTree;
   end new_tree;

   ----------------------------------------------------------
   -- Purpose: Returns the left branch of the given Tree
   -- Parameters: t: Tree
   -- Precondition:
   -- Postcondition:
   ----------------------------------------------------------
   function left (t: Tree) return Tree is

   begin
      return t.left;
   end left;

   ----------------------------------------------------------
   -- Purpose: Returns the right branch of the given Tree
   -- Parameters: t: Tree
   -- Precondition:
   -- Postcondition:
   ----------------------------------------------------------
   function right (t: Tree) return Tree is

   begin
      return t.right;
   end right;

   ----------------------------------------------------------
   -- Purpose: Returns the data section of the Tree
   -- Parameters: t: Tree
   -- Precondition:
   -- Postcondition:
   ----------------------------------------------------------
   function data (t: Tree) return Item_Type is

   begin
      return t.data;
   end data;

   ----------------------------------------------------------
   -- Purpose: Where all the caculations on the stacks are performed
   -- Parameters:
   -- Precondition:
   -- Postcondition:
   ----------------------------------------------------------
   procedure put_pre_order (t: Tree) is
   begin

      if not is_empty(t) then
         put(t.data);

         put_pre_order(t.left);
         put_pre_order(t.right);
      end if;

   end put_pre_order;


end tree_pkg;

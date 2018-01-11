generic
      type Item_Type is private;

      with procedure put(i : Item_Type);

   package Tree_Pkg is
      type Tree is private;

      Empty : constant Tree;

      function is_leaf (t : Tree) return Boolean with pre => not is_empty (t);
      function is_empty (t : Tree) return Boolean;

      function new_tree (i : Item_Type; l, r : Tree) return Tree;

      function left (t : Tree) return Tree with pre => not is_empty (t);
      function right (t : Tree) return Tree with pre => not is_empty (t);

      function data (t : Tree) return Item_Type with pre => not is_empty (t);

      procedure put_pre_order (t : Tree);

   private

   type TreeNode;

   type Tree is access TreeNode;

   type TreeNode is record
      left: Tree;
      right: Tree;
      data: Item_Type;
   end record;

   Empty: constant Tree := null;

   end Tree_Pkg;

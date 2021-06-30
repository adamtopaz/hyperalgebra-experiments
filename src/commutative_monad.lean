import control.monad.basic
import data.set.constructions

class commutative_monad (M : Type* → Type*) [monad M] [is_lawful_monad M] :=
(commutative : Π {α β γ} (ma : M α) (mb : M β) (f : α → β → M γ),
  (do { a ← ma, b ← mb, f a b }) = (do { b ← mb, a ← ma, f a b }) . obviously)

-- For regular operations
instance : commutative_monad id := {}

-- For hyperoperations
instance : commutative_monad set := {}

-- For partially defined operations
instance : commutative_monad option := {}

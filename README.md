# Easy Arel

With `EasyArel` instead of: 

    Thing.arel_table[:created_at]

you can say

    Thing[:created_at]
    
`EasyArel` also creates class & instance methods named `_` that reference your class, So in your model you can be all like

    scope :recent, order(_[:created_at].desc)

You can't just use the brackets in this case, because that would just be an array. It's stupid, but I didn't feel like experimenting with any crazy operator overloading. I'm open to suggestions on making this better.

I doubt this is even a good idea, but whatever, tests pass.

module Main exposing (..)

-- import Next.Internal.Model exposing (..)

import AnimationFrame
import Color exposing (Color)
import Html
import Html.Events
import Mouse
import Next.Element exposing (..)
import Next.Element.Attributes exposing (..)
import Next.Style.Color as Color
import Next.Style.Font as Font
import Time exposing (Time)


type Checkpoint
    = Start
    | Point Int
    | End
    | MousePosition


main =
    Html.program
        { init =
            ( Debug.log "init"
                { timeline = 0
                , trackingMouse = False
                }
            , Cmd.none
            )
        , view = view
        , update = update
        , subscriptions =
            \model -> Sub.none
        }


type Msg
    = NoOp



-- | StartAnim
-- | Tick Time
-- | StopMouse
-- | FollowMouse { x : Int, y : Int }


update msg model =
    case msg of
        -- Tick time ->
        --     ( { model | timeline = Animator.update time model.timeline }
        --     , Cmd.none
        --     )
        -- StartAnim ->
        --     ( { model
        --         | timeline = Animator.start timeline model.timeline
        --         , trackingMouse = True
        --       }
        --     , Cmd.none
        --     )
        NoOp ->
            ( model, Cmd.none )



{- Revised Alignment

   alignLeft, alignRight, center, verticalCenter, alignTop, alignBottom all apply to the element they are attached to.

   spread, spreadVertically, and spacing all apply to children.



-}
-- layers =
--     layered <|
-- navWithJustContainers =
--     viewport <|
--         column []
--             [ row [ height (px 80) ]
--                 [ el [ alignleft ] (text "logo")
--                 , el [ center ]
--                     (text "Matthew Griffith")
--                 , el [ alignRight ]
--                     (text "option menu")
--                     |> below
--                         (column []
--                             [ text "option 1"
--                             , text "option 2"
--                             ]
--                         )
--                 ]
--             , mainContent []
--                 [ text "heres the content" ]
--             ]
-- navWithAlignmentBuiltIn =
--     viewport <|
--         column []
--             [ row [ height (px 80) ]
--                 [ left [] (text "logo")
--                 , center []
--                     (text "Matthew Griffith")
--                 , right []
--                     (text "option menu")
--                     |> below []
--                         (column []
--                             [ text "option 1"
--                             , text "option 2"
--                             ]
--                         )
--                 ]
--             , mainContent []
--                 [ text "heres the content" ]
--             ]


view model =
    viewport
        [ Color.text Color.blue
        , Color.background Color.green
        , Font.family
            [ Font.typeface "Garamond EB"
            , Font.typeface "georgia"
            , Font.serif
            ]
        ]
    <|
        -- el
        --     [ Content.center
        --     , verticalCenter
        --     , Color.background Color.blue
        --     , Color.text Color.white
        --     , width (px 200)
        --     , height (px 200)
        --     ]
        --     (text "box")
        column []
            [ row
                [ Color.background Color.white
                , height (px 80)
                , verticalCenter

                -- , spaceEvenly
                -- , paddingLeft (px 20)
                -- , paddingRight (px 20)
                ]
                [ el
                    [ verticalCenter
                    , alignLeft

                    --, center
                    -- , height fill
                    , Color.background Color.blue
                    , Color.text Color.white
                    ]
                    (text "My Logo")
                , el
                    [ verticalCenter

                    -- , center
                    ]
                    (text "My Name is Spartacus")
                , row [ verticalCenter, alignRight, Color.background Color.yellow ]
                    [ text "hello!"
                    , text "hello!"
                    , text "hello!"
                        |> below
                            (el [] (text "I am below, yup!"))
                    ]
                ]

            -- , el [] (text "hello")
            -- , el [] (text "hello")
            -- , el [] (text "hello")
            -- , el [] (text "hello")
            -- , el [] (text "hello")
            ]



-- [ el
--     [ Color.text Color.white
--     , Color.background Color.blue
--     ]
--     (text "Box!")
-- , el
--     [ Color.text Color.white
--     , Color.background Color.blue
--     , center
--     ]
--     (text "Box!")
-- , el
--     [ Color.text Color.white
--     , Color.background Color.blue
--     ]
--     (text "Box!")
-- ]
-- column
--     [ center
--     , verticalCenter
--     , height (px 200)
--     , width (px 500)
--     , spacing 20
--     -- , verticalCenter
--     -- , spread
--     , Color.text Color.blue
--     , Color.background Color.grey
--     ]
--     [ el
--         [ Color.text Color.blue
--         , Color.background Color.white
--         -- , prop "opacity" "1"
--         ]
--         (text "First!")
--     , el
--         [ --width content
--           center
--         , Color.text Color.blue
--         , Color.background Color.white
--         ]
--         (text "Second")
--     -- , paragraph []
--     --     [ text "Hello "
--     --     , text "Hello "
--     --     , text "Hello "
--     --     , text "Hello "
--     --     , el
--     --         [ Color.text Color.blue
--     --         , Color.background Color.white
--     --         ]
--     --         (text "Second")
--     --     , text "Hello "
--     --     , text "Hello "
--     --     ]
--     ]


{-| Can we propogate a width or height up the tree?

In the following case, we'd like all `el`'s to get width fill

-}
mainOff =
    layout [] <|
        el [] <|
            el
                [ Color.background Color.blue
                , Color.text Color.white
                , width (px 200)
                ]
                (text "fill!")


mainNearby =
    layout [ center, verticalCenter, width (px 200), height (px 200) ]
        (text "Hello!"
            |> below
                (el [] (text "I am below, yup!"))
        )

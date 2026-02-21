<?php

return [

    /* =========================
     * OVERVIEW
     * ========================= */
    [
        'key'   => 'Dashboard',
        'icon'  => 'bx bx-home-alt',
        'route' => 'admin.dashboard',
        'roles' => ['owner','marketing','support','technician'],
    ],

    /* =========================
     * SUPPORT & KNOWLEDGE BASE
     * ========================= */
    [
        'key'   => 'Support & Help',
        'icon'  => 'far fa-question-circle',
        'roles' => ['owner','support'],
        'children' => [
            [
                'key'   => 'FAQ',
                'route' => 'admin.faq',
                'roles' => ['owner','support'],
            ],
            [
                'key'   => 'Documentation',
                'roles' => ['owner','support'],
                'children' => [
                    ['key' => 'All Documentation', 'route' => 'admin.documentation.index', 'roles' => ['owner','support']],
                    ['key' => 'System Architecture', 'route' => 'admin.starter', 'roles' => ['owner']],
                    ['key' => 'Landing Page System', 'route' => 'admin.starter', 'roles' => ['owner']],
                    ['key' => 'Product System', 'route' => 'admin.starter', 'roles' => ['owner']],
                    ['key' => 'Message System', 'route' => 'admin.starter', 'roles' => ['owner']],
                    ['key' => 'Chat System', 'route' => 'admin.starter', 'roles' => ['owner']],
                    ['key' => 'Chatbot System', 'route' => 'admin.starter', 'roles' => ['owner']],
                ]
            ],
        ]
    ],

    /* =========================
     * COMMUNICATION
     * ========================= */
    [
        'key'   => 'Communication',
        'icon'  => 'dripicons-message',
        'roles' => ['owner','support'],
        'children' => [
            ['key' => 'Messages', 'route' => 'admin.messages.index', 'roles' => ['owner','support']],
            ['key' => 'Chat', 'route' => 'admin.chat', 'roles' => ['owner','support']],
            [
                'key' => 'Chatbot',
                'roles' => ['owner','support'],
                'children' => [
                    ['key' => 'Auto Responses', 'route' => 'admin.chatbot', 'roles' => ['owner','support']],
                    ['key' => 'Smart Responses', 'route' => 'admin.chatbot.ml', 'roles' => ['owner']],
                ]
            ],
        ]
    ],

    /* =========================
     * OPERATIONS & SERVICES
     * ========================= */
    [
        'key'   => 'Operations',
        'icon'  => 'dripicons-article',
        'roles' => ['owner','support','technician'],
        'children' => [
            ['key' => 'Orders', 'route' => 'admin.starter', 'roles' => ['owner','support']],
            ['key' => 'Service Queue', 'route' => 'admin.starter', 'roles' => ['owner','support']],
            [
                'key' => 'Calendar',
                'route' => 'admin.starter',
                'roles' => ['owner','support','technician'],
                'children' => [
                    ['key' => 'Installation Schedule', 'route' => 'admin.starter', 'roles' => ['owner','support','technician']],
                    ['key' => 'Maintenance Schedule', 'route' => 'admin.starter', 'roles' => ['owner','support','technician']],
                    ['key' => 'Assignments', 'route' => 'admin.starter', 'roles' => ['owner','support']],
                ]
            ],
        ]
    ],

    /* =========================
     * CRM & USER MANAGEMENT
     * ========================= */
    [
        'key'   => 'CRM',
        'icon'  => 'dripicons-user-group',
        'roles' => ['owner','support'],
        'children' => [

            [
                'key' => 'Customers',
                'roles' => ['owner','support'],
                'children' => [
                    ['key' => 'Customer List', 'route' => 'admin.customers.index', 'roles' => ['owner','support']],
                    ['key' => 'Interaction History', 'route' => 'admin.starter', 'roles' => ['owner','support']],
                    ['key' => 'Orders History', 'route' => 'admin.starter', 'roles' => ['owner','support']],
                ]
            ],

            [
                'key' => 'Admins',
                'roles' => ['owner'],
                'children' => [
                    ['key' => 'Admin List', 'route' => 'admin.admin', 'roles' => ['owner']],
                    ['key' => 'Roles & Permissions', 'route' => 'admin.starter', 'roles' => ['owner']],
                    ['key' => 'Session History', 'route' => 'admin.history', 'roles' => ['owner']],
                ]
            ],

            [
                'key' => 'Technicians',
                'roles' => ['owner','support'],
                'children' => [
                    ['key' => 'Technician List', 'route' => 'admin.starter', 'roles' => ['owner','support']],
                    ['key' => 'Assignments', 'route' => 'admin.starter', 'roles' => ['owner','support']],
                    ['key' => 'Work History', 'route' => 'admin.starter', 'roles' => ['owner']],
                ]
            ],
        ]
    ],

    /* =========================
     * CONTENT & MARKETING
     * ========================= */
    [
        'key'   => 'Content',
        'icon'  => 'dripicons-browser',
        'roles' => ['owner','marketing'],
        'children' => [
            ['key' => 'Landing Pages', 'route' => 'admin.landingPageTables', 'roles' => ['owner','marketing']],
            ['key' => 'Section Content', 'route' => 'admin.subsectionTables', 'roles' => ['owner','marketing']],
            ['key' => 'Portfolio', 'route' => 'admin.portofolio', 'roles' => ['owner','marketing']],
            ['key' => 'Testimonials', 'route' => 'admin.testimonials', 'roles' => ['owner','marketing']],
        ]
    ],

    /* =========================
     * PRODUCTS & BUSINESS
     * ========================= */
    [
        'key'   => 'Products',
        'icon'  => 'mdi mdi-package-variant',
        'roles' => ['owner','marketing'],
        'children' => [
            ['key' => 'Products', 'route' => 'admin.productsTables', 'roles' => ['owner','marketing']],
            ['key' => 'Categories', 'route' => 'admin.categories', 'roles' => ['owner','marketing']],
            ['key' => 'Promotions & Discounts', 'route' => 'admin.promotion', 'roles' => ['owner','marketing']],
        ]
    ],

    /* =========================
     * SOCIAL MEDIA
     * ========================= */
    [
        'key'   => 'Social Media',
        'icon'  => 'dripicons-conversation',
        'roles' => ['owner','marketing'],
        'children' => [
            ['key' => 'Instagram Feeds', 'route' => 'admin.instagram', 'roles' => ['owner','marketing']],
            ['key' => 'TikTok Feeds', 'route' => 'admin.tiktok', 'roles' => ['owner','marketing']],
        ]
    ],

    /* =========================
     * OWNER PANEL (EXCLUSIVE)
     * ========================= */
    [
        'key'   => 'Owner Panel',
        'icon'  => 'bx bx-shield-quarter',
        'roles' => ['owner'],
        'children' => [
            ['key' => 'Access Logs', 'route' => 'admin.access-logs', 'roles' => ['owner']],
            ['key' => 'Activity Logs', 'route' => 'admin.activity-logs', 'roles' => ['owner']],
            ['key' => 'System Health', 'route' => 'admin.system-health', 'roles' => ['owner']],
            [
                'key' => 'Service Overview', 
                'roles' => ['owner'],
                'children' => [
                    ['key' => 'Overview Dashboard', 'route' => 'admin.starter', 'roles' => ['owner']],
                    ['key' => 'Requests', 'route' => 'admin.starter', 'roles' => ['owner']],
                    ['key' => 'Calendar', 'route' => 'admin.starter', 'roles' => ['owner']],
                    ['key' => 'Technicians', 'route' => 'admin.service.technicians-grid', 'roles' => ['owner']],
                    ['key' => 'Analytics', 'route' => 'admin.starter', 'roles' => ['owner']],
                ]
            ],
            ['key' => 'Business Reports', 'route' => 'admin.starter', 'roles' => ['owner']],
            ['key' => 'Company Services', 'route' => 'admin.starter', 'roles' => ['owner']],
        ]
    ],

];

import { SharedInertiaData } from "@/types/inertia";
import { usePage } from "@inertiajs/react";
import {
    ActivitySquare, BaggageClaim,
    Blocks,
    Building2, Cctv, ClipboardList, Globe2,
    Layout, Server, Users,
} from "lucide-react";
import SidebarItem from "@/Components/SiderbarItem";

const Routes1 = [
    {
        icon: Layout,
        label: "Dasbor",
        href: "/dashboard",
        requiredRoles: ["Admin"]
    }
];

const Routes2 = [
    {
        icon: Building2,
        label: "Gedung",
        href: "/building",
        requiredRoles: ["Admin"],
    },
    {
        icon: Blocks,
        label: "Kategori barang",
        href: "/categories",
        requiredRoles: ["Admin"],
    },
    {
        icon: ActivitySquare,
        label: "Kondisi",
        href: "/conditions",
        requiredRoles: ["Admin"],
    },
    {
        icon: BaggageClaim,
        label: "Jenis akuisisi",
        href: "/item",
        requiredRoles: ["Admin"],
    },
];


const Routes3 = [
    {
        icon: Server,
        label: "Aset",
        href: "/placements",
        requiredRoles: ["Admin"],
    },
    {
        icon: Cctv,
        label: "Penempatan",
        href: "/placements",
        requiredRoles: ["Admin"],
    },
    {
        icon: ClipboardList,
        label: "Laporan",
        href: "/reports",
        requiredRoles: ["Admin"],
    },
];

const Routes4 = [
    {
        icon: Users,
        label: "Pengguna",
        href: "/users",
        requiredRoles: ["Admin"],
    },
    {
        icon: Globe2,
        label: "website",
        href: "/web",
        requiredRoles: ["Admin"],
    },
];

const SidebarRoutes = () => {
    const { auth } = usePage<SharedInertiaData>().props;

    return (
        <>
            <div className="flex flex-col w-full">
                {Routes1.map(
                    (route, index) =>
                        (!route.requiredRoles ||
                            (auth &&
                                route.requiredRoles.some(
                                    (role) => auth.user && auth.roles.includes(role)
                                ))) && (
                            <SidebarItem
                                key={index}
                                icon={route.icon}
                                href={route.href}
                                label={route.label}
                                requiredRoles={route.requiredRoles}
                            />
                        )
                )}
            </div>

            <div className="flex flex-col w-full mt-7">
                <h1 className="pl-6 mb-1 text-xs uppercase font-semibold text-muted-foreground">Master data</h1>
                {Routes2.map(
                    (route, index) =>
                        (!route.requiredRoles ||
                            (auth &&
                                route.requiredRoles.some(
                                    (role) => auth.user && auth.roles.includes(role)
                                ))) && (
                            <SidebarItem
                                key={index}
                                icon={route.icon}
                                href={route.href}
                                label={route.label}
                                requiredRoles={route.requiredRoles}
                            />
                        )
                )}
            </div>

            <div className="flex flex-col w-full mt-7">
                <h1 className="pl-6 mb-1 text-xs uppercase font-semibold text-muted-foreground">Aktivitas</h1>
                {Routes3.map(
                    (route, index) =>
                        (!route.requiredRoles ||
                            (auth &&
                                route.requiredRoles.some(
                                    (role) => auth.user && auth.roles.includes(role)
                                ))) && (
                            <SidebarItem
                                key={index}
                                icon={route.icon}
                                href={route.href}
                                label={route.label}
                                requiredRoles={route.requiredRoles}
                            />
                        )
                )}
            </div>

            <div className="flex flex-col w-full mt-7">
                <h1 className="pl-6 mb-1 text-xs uppercase font-semibold text-muted-foreground">Pengaturan</h1>
                {Routes4.map(
                    (route, index) =>
                        (!route.requiredRoles ||
                            (auth &&
                                route.requiredRoles.some(
                                    (role) => auth.user && auth.roles.includes(role)
                                ))) && (
                            <SidebarItem
                                key={index}
                                icon={route.icon}
                                href={route.href}
                                label={route.label}
                                requiredRoles={route.requiredRoles}
                            />
                        )
                )}
            </div>
        </>
    );
};

export default SidebarRoutes;

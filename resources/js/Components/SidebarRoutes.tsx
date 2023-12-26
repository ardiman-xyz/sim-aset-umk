import { SharedInertiaData } from "@/types/inertia";
import { usePage } from "@inertiajs/react";
import {
    Layout,
    Users,
} from "lucide-react";
import SidebarItem from "@/Components/SiderbarItem";

const Routes = [
    {
        icon: Layout,
        label: "Dasbor",
        href: "/dashboard",
        requiredRoles: ["Admin"],
    },
    {
        icon: Users,
        label: "Guru",
        href: "/teacher",
        requiredRoles: ["Admin"],
    },
];

const SidebarRoutes = () => {
    const { auth } = usePage<SharedInertiaData>().props;

    return (
        <div className="flex flex-col w-full">
            {Routes.map(
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
    );
};

export default SidebarRoutes;
